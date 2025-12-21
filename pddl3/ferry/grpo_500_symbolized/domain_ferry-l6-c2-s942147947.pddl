(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_4 ?v6)
		(pred_6 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v6 ?v5)
		(pred_1)
		(pred_5 ?v6))

   (:action op_1
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_6 ?v1) (pred_6 ?v2) (pred_3 ?v1))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v7)
			    (pred_2 ?v8 ?v7) (pred_3 ?v7) (pred_1))
       :effect (and (pred_5 ?v8)
		    (not (pred_2 ?v8 ?v7)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v7)
			    (pred_5 ?v8) (pred_3 ?v7))
       :effect (and (pred_2 ?v8 ?v7)
		    (pred_1)
		    (not (pred_5 ?v8)))))
