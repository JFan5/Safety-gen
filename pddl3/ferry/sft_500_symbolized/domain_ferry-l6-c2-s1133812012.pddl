(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_2 ?v3)
		(pred_5 ?v5)
		(pred_6 ?v5)
		(pred_3 ?v3 ?v5)
		(pred_1)
		(pred_4 ?v3))

   (:action op_1
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_5 ?v6) (pred_5 ?v4) (pred_6 ?v6))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v2)
			    (pred_3 ?v8 ?v2) (pred_6 ?v2) (pred_1))
       :effect (and (pred_4 ?v8)
		    (not (pred_3 ?v8 ?v2)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v2)
			    (pred_4 ?v8) (pred_6 ?v2))
       :effect (and (pred_3 ?v8 ?v2)
		    (pred_1)
		    (not (pred_4 ?v8)))))
