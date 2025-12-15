(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v10)
             (pred_11 ?v12 ?v3)
             (pred_4 ?v2 ?v3)
             (pred_10 ?v1 ?v2 )
	     (pred_6 ?v2)
             (pred_8 ?v5)
             (pred_2 ?v12)
             (pred_12 ?v3)
             (pred_1 ?v2)
             (pred_9 ?v12)
             (pred_3 ?v2)
             (pred_7 ))



(:action op_3
:parameters (?v7 ?v13 ?v6 ?v4)
:precondition (and (pred_8 ?v7) (pred_8 ?v13) (pred_2 ?v6) (pred_12 ?v4)
          (pred_5 ?v7 ?v13) (pred_11 ?v6 ?v4)
                   (pred_4 ?v13 ?v4) (pred_6 ?v7) 
                   (pred_1 ?v13) (pred_9 ?v6))
:effect (and  (pred_3 ?v13) (not (pred_1 ?v13))))


(:action op_5
:parameters (?v7 ?v9)
:precondition (and (pred_8 ?v7) (pred_8 ?v9)
               (pred_6 ?v7) (pred_5 ?v7 ?v9) (pred_3 ?v9))
:effect (and (pred_6 ?v9) (not (pred_6 ?v7))))

(:action op_4
:parameters (?v7 ?v6)
:precondition (and (pred_8 ?v7) (pred_2 ?v6) 
                  (pred_6 ?v7) (pred_10 ?v6 ?v7) (pred_7 ))
:effect (and (pred_9 ?v6)
   (not (pred_10 ?v6 ?v7)) (not (pred_7 ))))


(:action op_1
:parameters (?v7 ?v11 ?v8)
:precondition (and (pred_8 ?v7) (pred_2 ?v11) (pred_2 ?v8)
                  (pred_6 ?v7) (pred_9 ?v8) (pred_10 ?v11 ?v7))
:effect (and (pred_9 ?v11) (pred_10 ?v8 ?v7)
        (not (pred_9 ?v8)) (not (pred_10 ?v11 ?v7))))

(:action op_2
:parameters (?v7 ?v6)
:precondition (and (pred_8 ?v7) (pred_2 ?v6) 
                  (pred_6 ?v7) (pred_9 ?v6))
:effect (and (pred_7 ) (pred_10 ?v6 ?v7) (not (pred_9 ?v6)))))


	
