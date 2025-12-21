(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_01 obj_05 obj_06 obj_04 - type_3
obj_07 obj_03 obj_02 - type_2
obj_09 obj_12 obj_10 - object)
(:init
(pred_4 obj_08 obj_02)
(pred_2 obj_08 obj_01)
(pred_2 obj_08 obj_05)
(pred_4 obj_11 obj_03)
(pred_2 obj_11 obj_06)
(pred_2 obj_11 obj_04)
(pred_3 obj_09 obj_02)
(pred_3 obj_12 obj_02)
(pred_3 obj_10 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_12 obj_03)
(pred_3 obj_10 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_02) (pred_4 obj_11 obj_02))))
  )
)
)