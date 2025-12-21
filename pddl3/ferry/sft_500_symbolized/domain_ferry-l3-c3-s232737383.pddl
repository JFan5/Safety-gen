(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_1 ?v7)
		(pred_3 ?v2)
		(pred_4 ?v2)
		(pred_6 ?v7 ?v2)
		(pred_5)
		(pred_2 ?v7))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_3 ?v6) (pred_3 ?v5) (pred_4 ?v6))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_1 ?v4) (pred_3 ?v3)
			    (pred_6 ?v4 ?v3) (pred_4 ?v3) (pred_5))
       :effect (and (pred_2 ?v4)
		    (not (pred_6 ?v4 ?v3)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_1 ?v4) (pred_3 ?v3)
			    (pred_2 ?v4) (pred_4 ?v3))
       :effect (and (pred_6 ?v4 ?v3)
		    (pred_5)
		    (not (pred_2 ?v4)))))
