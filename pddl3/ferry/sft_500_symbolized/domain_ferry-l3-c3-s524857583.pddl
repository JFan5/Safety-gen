(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_6 ?v6)
		(pred_5 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v6 ?v5)
		(pred_1)
		(pred_4 ?v6))

   (:action op_2
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_5 ?v8) (pred_5 ?v1) (pred_3 ?v8))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v8))))


   (:action op_3
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_6 ?v4) (pred_5 ?v3)
			    (pred_2 ?v4 ?v3) (pred_3 ?v3) (pred_1))
       :effect (and (pred_4 ?v4)
		    (not (pred_2 ?v4 ?v3)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_6 ?v4) (pred_5 ?v3)
			    (pred_4 ?v4) (pred_3 ?v3))
       :effect (and (pred_2 ?v4 ?v3)
		    (pred_1)
		    (not (pred_4 ?v4)))))
