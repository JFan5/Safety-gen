(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_4 ?v4)
		(pred_6 ?v1)
		(pred_5 ?v1)
		(pred_3 ?v4 ?v1)
		(pred_1)
		(pred_2 ?v4))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_6 ?v6) (pred_6 ?v5) (pred_5 ?v6))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v6))))


   (:action op_1
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_3 ?v8 ?v3) (pred_5 ?v3) (pred_1))
       :effect (and (pred_2 ?v8)
		    (not (pred_3 ?v8 ?v3)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_2 ?v8) (pred_5 ?v3))
       :effect (and (pred_3 ?v8 ?v3)
		    (pred_1)
		    (not (pred_2 ?v8)))))
