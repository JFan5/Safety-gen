(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_3 ?v3)
		(pred_2 ?v7)
		(pred_4 ?v7)
		(pred_5 ?v3 ?v7)
		(pred_1)
		(pred_6 ?v3))

   (:action op_2
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_2 ?v6) (pred_2 ?v1) (pred_4 ?v6))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v2)
			    (pred_5 ?v8 ?v2) (pred_4 ?v2) (pred_1))
       :effect (and (pred_6 ?v8)
		    (not (pred_5 ?v8 ?v2)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v2)
			    (pred_6 ?v8) (pred_4 ?v2))
       :effect (and (pred_5 ?v8 ?v2)
		    (pred_1)
		    (not (pred_6 ?v8)))))
