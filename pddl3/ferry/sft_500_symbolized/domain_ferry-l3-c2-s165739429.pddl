(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_1 ?v3)
		(pred_2 ?v2)
		(pred_6 ?v2)
		(pred_4 ?v3 ?v2)
		(pred_3)
		(pred_5 ?v3))

   (:action op_1
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_2 ?v1) (pred_2 ?v6) (pred_6 ?v1))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v1))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v7)
			    (pred_4 ?v8 ?v7) (pred_6 ?v7) (pred_3))
       :effect (and (pred_5 ?v8)
		    (not (pred_4 ?v8 ?v7)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v7)
			    (pred_5 ?v8) (pred_6 ?v7))
       :effect (and (pred_4 ?v8 ?v7)
		    (pred_3)
		    (not (pred_5 ?v8)))))
