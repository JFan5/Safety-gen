(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_2 ?v2)
		(pred_5 ?v8)
		(pred_1 ?v8)
		(pred_4 ?v2 ?v8)
		(pred_3)
		(pred_6 ?v2))

   (:action op_3
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_5 ?v5) (pred_5 ?v7) (pred_1 ?v5))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v5))))


   (:action op_2
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v3)
			    (pred_4 ?v6 ?v3) (pred_1 ?v3) (pred_3))
       :effect (and (pred_6 ?v6)
		    (not (pred_4 ?v6 ?v3)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v3)
			    (pred_6 ?v6) (pred_1 ?v3))
       :effect (and (pred_4 ?v6 ?v3)
		    (pred_3)
		    (not (pred_6 ?v6)))))
