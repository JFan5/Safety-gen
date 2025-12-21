(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_05 obj_03 obj_07 obj_11 - type_3
obj_02 obj_04 obj_06 - type_2
obj_01 obj_10 obj_08 - object)
(:init
(pred_4 obj_12 obj_06)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_03)
(pred_4 obj_09 obj_04)
(pred_2 obj_09 obj_07)
(pred_2 obj_09 obj_11)
(pred_3 obj_01 obj_02)
(pred_3 obj_10 obj_06)
(pred_3 obj_08 obj_06)
)
(:goal
(and
(pred_3 obj_01 obj_06)
(pred_3 obj_10 obj_02)
(pred_3 obj_08 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_12 obj_02) (pred_4 obj_09 obj_02))))
    (always (not (and (pred_4 obj_12 obj_06) (pred_4 obj_09 obj_06))))
  )
)
)