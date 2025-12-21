(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_10 - type_1
obj_01 obj_06 obj_03 obj_09 - type_3
obj_05 obj_11 obj_02 - type_2
obj_04 obj_12 obj_08 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_06)
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_09)
(pred_3 obj_04 obj_02)
(pred_3 obj_12 obj_02)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_11)
(pred_3 obj_12 obj_05)
(pred_3 obj_08 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_02) (pred_4 obj_10 obj_02))))
  )
)
)