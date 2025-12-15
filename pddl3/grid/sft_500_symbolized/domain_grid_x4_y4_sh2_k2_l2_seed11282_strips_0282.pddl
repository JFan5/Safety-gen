(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v5)
             (pred_9 ?v10 ?v6)
             (pred_12 ?v3 ?v6)
             (pred_11 ?v2 ?v3 )
	     (pred_7 ?v3)
             (pred_2 ?v1)
             (pred_1 ?v10)
             (pred_6 ?v6)
             (pred_3 ?v3)
             (pred_5 ?v10)
             (pred_10 ?v3)
             (pred_4 ))



(:action op_3
:parameters (?v13 ?v11 ?v7 ?v9)
:precondition (and (pred_2 ?v13) (pred_2 ?v11) (pred_1 ?v7) (pred_6 ?v9)
          (pred_8 ?v13 ?v11) (pred_9 ?v7 ?v9)
                   (pred_12 ?v11 ?v9) (pred_7 ?v13) 
                   (pred_3 ?v11) (pred_5 ?v7))
:effect (and  (pred_10 ?v11) (not (pred_3 ?v11))))


(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_2 ?v13) (pred_2 ?v12)
               (pred_7 ?v13) (pred_8 ?v13 ?v12) (pred_10 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v13))))

(:action op_2
:parameters (?v13 ?v7)
:precondition (and (pred_2 ?v13) (pred_1 ?v7) 
                  (pred_7 ?v13) (pred_11 ?v7 ?v13) (pred_4 ))
:effect (and (pred_5 ?v7)
   (not (pred_11 ?v7 ?v13)) (not (pred_4 ))))


(:action op_5
:parameters (?v13 ?v4 ?v8)
:precondition (and (pred_2 ?v13) (pred_1 ?v4) (pred_1 ?v8)
                  (pred_7 ?v13) (pred_5 ?v8) (pred_11 ?v4 ?v13))
:effect (and (pred_5 ?v4) (pred_11 ?v8 ?v13)
        (not (pred_5 ?v8)) (not (pred_11 ?v4 ?v13))))

(:action op_4
:parameters (?v13 ?v7)
:precondition (and (pred_2 ?v13) (pred_1 ?v7) 
                  (pred_7 ?v13) (pred_5 ?v7))
:effect (and (pred_4 ) (pred_11 ?v7 ?v13) (not (pred_5 ?v7)))))


	
