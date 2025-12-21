(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_5 ?v7)
		(pred_4 ?v6)
		(pred_2 ?v6)
		(pred_6 ?v7 ?v6)
		(pred_1)
		(pred_3 ?v7))

   (:action op_2
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_4 ?v8) (pred_4 ?v3) (pred_2 ?v8))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v8))))


   (:action op_1
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v5)
			    (pred_6 ?v2 ?v5) (pred_2 ?v5) (pred_1))
       :effect (and (pred_3 ?v2)
		    (not (pred_6 ?v2 ?v5)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v5)
			    (pred_3 ?v2) (pred_2 ?v5))
       :effect (and (pred_6 ?v2 ?v5)
		    (pred_1)
		    (not (pred_3 ?v2)))))
