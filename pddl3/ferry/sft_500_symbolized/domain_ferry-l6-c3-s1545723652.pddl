(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_3 ?v1)
		(pred_1 ?v7)
		(pred_6 ?v7)
		(pred_2 ?v1 ?v7)
		(pred_4)
		(pred_5 ?v1))

   (:action op_3
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_1 ?v8) (pred_1 ?v3) (pred_6 ?v8))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v2)
			    (pred_2 ?v6 ?v2) (pred_6 ?v2) (pred_4))
       :effect (and (pred_5 ?v6)
		    (not (pred_2 ?v6 ?v2)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v2)
			    (pred_5 ?v6) (pred_6 ?v2))
       :effect (and (pred_2 ?v6 ?v2)
		    (pred_4)
		    (not (pred_5 ?v6)))))
