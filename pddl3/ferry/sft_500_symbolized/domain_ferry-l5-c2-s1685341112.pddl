(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_3 ?v2)
		(pred_1 ?v4)
		(pred_2 ?v4)
		(pred_6 ?v2 ?v4)
		(pred_4)
		(pred_5 ?v2))

   (:action op_1
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_1 ?v7) (pred_1 ?v5) (pred_2 ?v7))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v7))))


   (:action op_3
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v6)
			    (pred_6 ?v3 ?v6) (pred_2 ?v6) (pred_4))
       :effect (and (pred_5 ?v3)
		    (not (pred_6 ?v3 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v6)
			    (pred_5 ?v3) (pred_2 ?v6))
       :effect (and (pred_6 ?v3 ?v6)
		    (pred_4)
		    (not (pred_5 ?v3)))))
