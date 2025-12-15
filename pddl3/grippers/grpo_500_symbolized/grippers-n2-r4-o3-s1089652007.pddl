(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_01 - type_1
obj_05 obj_11 obj_07 obj_08 - type_3
obj_12 obj_03 obj_02 obj_13 - type_2
obj_06 obj_10 obj_09 - object)
(:init
(pred_3 obj_04 obj_13)
(pred_4 obj_04 obj_05)
(pred_4 obj_04 obj_11)
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_08)
(pred_2 obj_06 obj_13)
(pred_2 obj_10 obj_02)
(pred_2 obj_09 obj_12)
)
(:goal
(and
(pred_2 obj_06 obj_13)
(pred_2 obj_10 obj_12)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_12) (pred_3 obj_01 obj_12))))
    (always (not (and (pred_3 obj_04 obj_02) (pred_3 obj_01 obj_02))))
  )
)
)