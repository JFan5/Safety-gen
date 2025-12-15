(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_12 obj_02 obj_05 obj_01 - type_3
obj_06 obj_09 obj_07 - type_2
obj_11 obj_04 obj_03 - object)
(:init
(pred_3 obj_08 obj_07)
(pred_4 obj_08 obj_12)
(pred_4 obj_08 obj_02)
(pred_3 obj_10 obj_09)
(pred_4 obj_10 obj_05)
(pred_4 obj_10 obj_01)
(pred_2 obj_11 obj_07)
(pred_2 obj_04 obj_07)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_11 obj_06)
(pred_2 obj_04 obj_06)
(pred_2 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_07) (pred_3 obj_10 obj_07))))
  )
)
)