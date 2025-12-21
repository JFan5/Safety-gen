(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_3 ?v4)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_4 ?v4 ?v8)
		(pred_6)
		(pred_2 ?v4))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_1 ?v2) (pred_1 ?v7) (pred_5 ?v2))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v2))))


   (:action op_1
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v3)
			    (pred_4 ?v6 ?v3) (pred_5 ?v3) (pred_6))
       :effect (and (pred_2 ?v6)
		    (not (pred_4 ?v6 ?v3)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v3)
			    (pred_2 ?v6) (pred_5 ?v3))
       :effect (and (pred_4 ?v6 ?v3)
		    (pred_6)
		    (not (pred_2 ?v6)))))
