(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_06 - type_3
obj_07 obj_09 obj_03 obj_04 - type_1
obj_08 obj_02 obj_10 obj_05 - type_2
obj_01 obj_11 obj_12 obj_14 - object)
(:init
(pred_4 obj_13 obj_05)
(pred_1 obj_13 obj_07)
(pred_1 obj_13 obj_09)
(pred_4 obj_06 obj_10)
(pred_1 obj_06 obj_03)
(pred_1 obj_06 obj_04)
(pred_2 obj_01 obj_02)
(pred_2 obj_11 obj_08)
(pred_2 obj_12 obj_05)
(pred_2 obj_14 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_10)
(pred_2 obj_11 obj_10)
(pred_2 obj_12 obj_08)
(pred_2 obj_14 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_13 obj_08) (pred_4 obj_06 obj_08))))
    (always (not (and (pred_4 obj_13 obj_02) (pred_4 obj_06 obj_02))))
  )
)
)