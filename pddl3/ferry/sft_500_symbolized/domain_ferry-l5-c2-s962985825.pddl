(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_3 ?v5)
		(pred_6 ?v2)
		(pred_1 ?v2)
		(pred_5 ?v5 ?v2)
		(pred_4)
		(pred_2 ?v5))

   (:action op_2
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_6 ?v7) (pred_6 ?v1) (pred_1 ?v7))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v6)
			    (pred_5 ?v8 ?v6) (pred_1 ?v6) (pred_4))
       :effect (and (pred_2 ?v8)
		    (not (pred_5 ?v8 ?v6)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v6)
			    (pred_2 ?v8) (pred_1 ?v6))
       :effect (and (pred_5 ?v8 ?v6)
		    (pred_4)
		    (not (pred_2 ?v8)))))
