(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_3 ?v1)
		(pred_5 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v1 ?v4)
		(pred_1)
		(pred_4 ?v1))

   (:action op_1
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_5 ?v5) (pred_5 ?v2) (pred_6 ?v5))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v5))))


   (:action op_3
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_5 ?v7)
			    (pred_2 ?v8 ?v7) (pred_6 ?v7) (pred_1))
       :effect (and (pred_4 ?v8)
		    (not (pred_2 ?v8 ?v7)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_5 ?v7)
			    (pred_4 ?v8) (pred_6 ?v7))
       :effect (and (pred_2 ?v8 ?v7)
		    (pred_1)
		    (not (pred_4 ?v8)))))
