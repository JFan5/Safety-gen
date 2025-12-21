(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_2 ?v6)
		(pred_4 ?v3)
		(pred_6 ?v3)
		(pred_3 ?v6 ?v3)
		(pred_1)
		(pred_5 ?v6))

   (:action op_1
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_4 ?v5) (pred_4 ?v4) (pred_6 ?v5))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v5))))


   (:action op_3
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v8)
			    (pred_3 ?v7 ?v8) (pred_6 ?v8) (pred_1))
       :effect (and (pred_5 ?v7)
		    (not (pred_3 ?v7 ?v8)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v8)
			    (pred_5 ?v7) (pred_6 ?v8))
       :effect (and (pred_3 ?v7 ?v8)
		    (pred_1)
		    (not (pred_5 ?v7)))))
