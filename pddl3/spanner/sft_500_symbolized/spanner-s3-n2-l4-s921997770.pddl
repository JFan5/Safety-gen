; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 921997770 --problem-name spanner-s3-n2-l4-s921997770
(define (problem spanner-s3-n2-l4-s921997770)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_11 obj_06 obj_09 - type_1
     obj_10 obj_04 - type_2
     obj_12 obj_05 obj_01 obj_03 - type_4
     obj_07 obj_02 - type_4
    )
 (:init 
    (pred_3 obj_08 obj_07)
    (pred_3 obj_11 obj_03)
    (pred_4 obj_11)
    (pred_3 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_3 obj_09 obj_01)
    (pred_4 obj_09)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_02)
    (pred_1 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_5 obj_07 obj_12)
    (pred_5 obj_03 obj_02)
    (pred_5 obj_12 obj_05)
    (pred_5 obj_05 obj_01)
    (pred_5 obj_01 obj_03)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
