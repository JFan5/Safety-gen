(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_2
obj_10 obj_11 obj_06 obj_12 - type_1
obj_01 obj_02 obj_09 - type_3
obj_04 obj_08 obj_05 - object)
(:init
(pred_3 obj_03 obj_01)
(pred_2 obj_03 obj_10)
(pred_2 obj_03 obj_11)
(pred_3 obj_07 obj_02)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_12)
(pred_4 obj_04 obj_02)
(pred_4 obj_08 obj_09)
(pred_4 obj_05 obj_01)
)
(:goal
(and
(pred_4 obj_04 obj_01)
(pred_4 obj_08 obj_01)
(pred_4 obj_05 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_02) (pred_3 obj_07 obj_02))))
  )
)
)