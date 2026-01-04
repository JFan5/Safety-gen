(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_5 ?v8)
		(pred_6 ?v7)
		(pred_4 ?v7)
		(pred_2 ?v8 ?v7)
		(pred_1)
		(pred_3 ?v8))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_6 ?v6) (pred_6 ?v5) (pred_4 ?v6))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_5 ?v3) (pred_6 ?v2)
			    (pred_2 ?v3 ?v2) (pred_4 ?v2) (pred_1))
       :effect (and (pred_3 ?v3)
		    (not (pred_2 ?v3 ?v2)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_5 ?v3) (pred_6 ?v2)
			    (pred_3 ?v3) (pred_4 ?v2))
       :effect (and (pred_2 ?v3 ?v2)
		    (pred_1)
		    (not (pred_3 ?v3)))))
