(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_06 obj_09 obj_05 obj_01 - type_3
obj_10 obj_02 obj_11 - type_2
obj_07 obj_04 obj_12 - object)
(:init
(pred_3 obj_08 obj_11)
(pred_4 obj_08 obj_06)
(pred_4 obj_08 obj_09)
(pred_3 obj_03 obj_10)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_01)
(pred_2 obj_07 obj_10)
(pred_2 obj_04 obj_11)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_12 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_02) (pred_3 obj_03 obj_02))))
  )
)
)