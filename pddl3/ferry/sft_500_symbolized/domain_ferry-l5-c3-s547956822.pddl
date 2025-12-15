(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_1 ?v7)
		(pred_6 ?v4)
		(pred_3 ?v4)
		(pred_2 ?v7 ?v4)
		(pred_4)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_6 ?v1) (pred_6 ?v5) (pred_3 ?v1))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v1))))


   (:action op_3
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_6 ?v2)
			    (pred_2 ?v6 ?v2) (pred_3 ?v2) (pred_4))
       :effect (and (pred_5 ?v6)
		    (not (pred_2 ?v6 ?v2)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_6 ?v2)
			    (pred_5 ?v6) (pred_3 ?v2))
       :effect (and (pred_2 ?v6 ?v2)
		    (pred_4)
		    (not (pred_5 ?v6)))))
