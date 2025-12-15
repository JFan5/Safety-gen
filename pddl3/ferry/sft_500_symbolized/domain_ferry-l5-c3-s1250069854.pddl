(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_2 ?v7)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_3 ?v7 ?v5)
		(pred_6)
		(pred_1 ?v7))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_5 ?v2) (pred_5 ?v3) (pred_4 ?v2))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v2))))


   (:action op_2
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v1)
			    (pred_3 ?v6 ?v1) (pred_4 ?v1) (pred_6))
       :effect (and (pred_1 ?v6)
		    (not (pred_3 ?v6 ?v1)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v1)
			    (pred_1 ?v6) (pred_4 ?v1))
       :effect (and (pred_3 ?v6 ?v1)
		    (pred_6)
		    (not (pred_1 ?v6)))))
