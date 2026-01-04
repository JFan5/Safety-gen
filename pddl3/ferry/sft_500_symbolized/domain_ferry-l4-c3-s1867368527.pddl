(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_5 ?v4)
		(pred_4 ?v3)
		(pred_1 ?v3)
		(pred_6 ?v4 ?v3)
		(pred_2)
		(pred_3 ?v4))

   (:action op_1
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_4 ?v2) (pred_4 ?v7) (pred_1 ?v2))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v1)
			    (pred_6 ?v6 ?v1) (pred_1 ?v1) (pred_2))
       :effect (and (pred_3 ?v6)
		    (not (pred_6 ?v6 ?v1)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v1)
			    (pred_3 ?v6) (pred_1 ?v1))
       :effect (and (pred_6 ?v6 ?v1)
		    (pred_2)
		    (not (pred_3 ?v6)))))
