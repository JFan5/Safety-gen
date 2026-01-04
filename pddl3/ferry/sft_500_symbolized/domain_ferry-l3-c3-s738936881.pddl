(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_2 ?v6)
		(pred_5 ?v8)
		(pred_3 ?v8)
		(pred_4 ?v6 ?v8)
		(pred_1)
		(pred_6 ?v6))

   (:action op_2
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_5 ?v7) (pred_5 ?v3) (pred_3 ?v7))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v7))))


   (:action op_3
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_5 ?v5)
			    (pred_4 ?v4 ?v5) (pred_3 ?v5) (pred_1))
       :effect (and (pred_6 ?v4)
		    (not (pred_4 ?v4 ?v5)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_5 ?v5)
			    (pred_6 ?v4) (pred_3 ?v5))
       :effect (and (pred_4 ?v4 ?v5)
		    (pred_1)
		    (not (pred_6 ?v4)))))
