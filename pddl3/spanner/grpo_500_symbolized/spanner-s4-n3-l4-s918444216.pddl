; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 918444216 --problem-name spanner-s4-n3-l4-s918444216
(define (problem spanner-s4-n3-l4-s918444216)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_08 obj_13 obj_02 obj_14 - type_3
     obj_01 obj_06 obj_05 - type_1
     obj_09 obj_07 obj_10 obj_04 - type_2
     obj_12 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_12)
    (pred_6 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_6 obj_13 obj_07)
    (pred_5 obj_13)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_6 obj_14 obj_07)
    (pred_5 obj_14)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_11)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_09 obj_07)
    (pred_3 obj_07 obj_10)
    (pred_3 obj_10 obj_04)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_06)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
