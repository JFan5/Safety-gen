(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_4 ?v7)
		(pred_6 ?v2)
		(pred_3 ?v2)
		(pred_2 ?v7 ?v2)
		(pred_5)
		(pred_1 ?v7))

   (:action op_3
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_6 ?v6) (pred_6 ?v1) (pred_3 ?v6))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v6))))


   (:action op_1
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_2 ?v8 ?v3) (pred_3 ?v3) (pred_5))
       :effect (and (pred_1 ?v8)
		    (not (pred_2 ?v8 ?v3)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_1 ?v8) (pred_3 ?v3))
       :effect (and (pred_2 ?v8 ?v3)
		    (pred_5)
		    (not (pred_1 ?v8)))))
