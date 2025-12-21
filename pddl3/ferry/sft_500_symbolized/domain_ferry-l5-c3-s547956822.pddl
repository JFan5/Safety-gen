(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_6 ?v7)
		(pred_5 ?v2)
		(pred_4 ?v2)
		(pred_2 ?v7 ?v2)
		(pred_3)
		(pred_1 ?v7))

   (:action op_2
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_5 ?v3) (pred_5 ?v6) (pred_4 ?v3))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v3))))


   (:action op_1
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v1)
			    (pred_2 ?v8 ?v1) (pred_4 ?v1) (pred_3))
       :effect (and (pred_1 ?v8)
		    (not (pred_2 ?v8 ?v1)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v1)
			    (pred_1 ?v8) (pred_4 ?v1))
       :effect (and (pred_2 ?v8 ?v1)
		    (pred_3)
		    (not (pred_1 ?v8)))))
