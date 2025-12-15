(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_4 ?v4)
		(pred_5 ?v5)
		(pred_1 ?v5)
		(pred_3 ?v4 ?v5)
		(pred_2)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_5 ?v7) (pred_5 ?v1) (pred_1 ?v7))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v7))))


   (:action op_2
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v2)
			    (pred_3 ?v6 ?v2) (pred_1 ?v2) (pred_2))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v2)
			    (pred_6 ?v6) (pred_1 ?v2))
       :effect (and (pred_3 ?v6 ?v2)
		    (pred_2)
		    (not (pred_6 ?v6)))))
