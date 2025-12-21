(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_3 ?v4)
		(pred_2 ?v2)
		(pred_6 ?v2)
		(pred_4 ?v4 ?v2)
		(pred_5)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_2 ?v3) (pred_2 ?v1) (pred_6 ?v3))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v3))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v7)
			    (pred_4 ?v8 ?v7) (pred_6 ?v7) (pred_5))
       :effect (and (pred_1 ?v8)
		    (not (pred_4 ?v8 ?v7)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v7)
			    (pred_1 ?v8) (pred_6 ?v7))
       :effect (and (pred_4 ?v8 ?v7)
		    (pred_5)
		    (not (pred_1 ?v8)))))
