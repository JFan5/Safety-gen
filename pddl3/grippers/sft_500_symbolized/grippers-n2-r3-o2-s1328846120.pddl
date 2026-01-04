(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_11 obj_02 obj_05 obj_01 - type_3
obj_09 obj_04 obj_07 - type_2
obj_10 obj_06 - object)
(:init
(pred_4 obj_08 obj_07)
(pred_2 obj_08 obj_11)
(pred_2 obj_08 obj_02)
(pred_4 obj_03 obj_09)
(pred_2 obj_03 obj_05)
(pred_2 obj_03 obj_01)
(pred_1 obj_10 obj_07)
(pred_1 obj_06 obj_09)
)
(:goal
(and
(pred_1 obj_10 obj_07)
(pred_1 obj_06 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_07) (pred_4 obj_03 obj_07))))
  )
)
)