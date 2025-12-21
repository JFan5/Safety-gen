; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1800780856 --problem-name spanner-s3-n2-l4-s1800780856
(define (problem spanner-s3-n2-l4-s1800780856)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_12 obj_10 obj_06 - type_3
     obj_09 obj_04 - type_1
     obj_02 obj_01 obj_08 obj_03 - type_2
     obj_11 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_11)
    (pred_6 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_6 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_6 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_07)
    (pred_3 obj_11 obj_02)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_02 obj_01)
    (pred_3 obj_01 obj_08)
    (pred_3 obj_08 obj_03)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
