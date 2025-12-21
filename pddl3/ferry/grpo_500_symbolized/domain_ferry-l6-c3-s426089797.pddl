(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_5 ?v7)
		(pred_1 ?v5)
		(pred_4 ?v5)
		(pred_6 ?v7 ?v5)
		(pred_2)
		(pred_3 ?v7))

   (:action op_3
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_1 ?v8) (pred_1 ?v3) (pred_4 ?v8))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v8))))


   (:action op_1
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v2)
			    (pred_6 ?v6 ?v2) (pred_4 ?v2) (pred_2))
       :effect (and (pred_3 ?v6)
		    (not (pred_6 ?v6 ?v2)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v2)
			    (pred_3 ?v6) (pred_4 ?v2))
       :effect (and (pred_6 ?v6 ?v2)
		    (pred_2)
		    (not (pred_3 ?v6)))))
