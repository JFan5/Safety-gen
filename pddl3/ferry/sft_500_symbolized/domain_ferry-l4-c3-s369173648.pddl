(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_2 ?v6)
		(pred_6 ?v3)
		(pred_4 ?v3)
		(pred_1 ?v6 ?v3)
		(pred_5)
		(pred_3 ?v6))

   (:action op_2
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_6 ?v1) (pred_6 ?v8) (pred_4 ?v1))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v1))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_1 ?v7 ?v4) (pred_4 ?v4) (pred_5))
       :effect (and (pred_3 ?v7)
		    (not (pred_1 ?v7 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_3 ?v7) (pred_4 ?v4))
       :effect (and (pred_1 ?v7 ?v4)
		    (pred_5)
		    (not (pred_3 ?v7)))))
