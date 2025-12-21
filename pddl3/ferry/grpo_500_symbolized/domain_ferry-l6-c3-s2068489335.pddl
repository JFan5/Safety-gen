(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_3 ?v1)
		(pred_2 ?v2)
		(pred_4 ?v2)
		(pred_5 ?v1 ?v2)
		(pred_6)
		(pred_1 ?v1))

   (:action op_3
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_2 ?v7) (pred_2 ?v4) (pred_4 ?v7))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v7))))


   (:action op_2
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v3)
			    (pred_5 ?v8 ?v3) (pred_4 ?v3) (pred_6))
       :effect (and (pred_1 ?v8)
		    (not (pred_5 ?v8 ?v3)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v3)
			    (pred_1 ?v8) (pred_4 ?v3))
       :effect (and (pred_5 ?v8 ?v3)
		    (pred_6)
		    (not (pred_1 ?v8)))))
