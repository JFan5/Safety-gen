(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_1 ?v7)
		(pred_3 ?v3)
		(pred_2 ?v3)
		(pred_6 ?v7 ?v3)
		(pred_4)
		(pred_5 ?v7))

   (:action op_3
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_3 ?v1) (pred_3 ?v5) (pred_2 ?v1))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v1))))


   (:action op_1
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_1 ?v8) (pred_3 ?v4)
			    (pred_6 ?v8 ?v4) (pred_2 ?v4) (pred_4))
       :effect (and (pred_5 ?v8)
		    (not (pred_6 ?v8 ?v4)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_1 ?v8) (pred_3 ?v4)
			    (pred_5 ?v8) (pred_2 ?v4))
       :effect (and (pred_6 ?v8 ?v4)
		    (pred_4)
		    (not (pred_5 ?v8)))))
