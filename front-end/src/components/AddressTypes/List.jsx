import { useEffect, useState } from "react";
import { read } from "../../api/fetch-wrapper";

export default function AddressTypesList() {
    const [addressTypes, setAddressTypes] = useState([]);
    const [error, setError] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchAddressTypes = async () => {
            setLoading(true);
            try {
                const data = await read("AddressTypes");
                setAddressTypes(data);
            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }
        };

        fetchAddressTypes();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;
    if (addressTypes.length === 0) return <div>No address types found.</div>;

    return (
        <div>
            <h2>Address Types</h2>
            <ul>
                {addressTypes.map((addressType) => (
                    <li key={addressType.addressTypeID}>
                        {addressType.addressTypeName}
                    </li>
                ))}
            </ul>
        </div>
    );
}                                                                                                    