; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1874507097 --problem-name spanner-s4-n3-l4-s1874507097
(define (problem spanner-s4-n3-l4-s1874507097)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_07 obj_01 obj_09 obj_13 - type_3
     obj_12 obj_05 obj_02 - type_1
     obj_10 obj_06 obj_04 obj_14 - type_2
     obj_11 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_11)
    (pred_6 obj_07 obj_04)
    (pred_5 obj_07)
    (pred_6 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_6 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_6 obj_13 obj_10)
    (pred_5 obj_13)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_03)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_3 obj_11 obj_10)
    (pred_3 obj_14 obj_03)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_04 obj_14)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_05)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
