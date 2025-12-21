(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_01 obj_03 obj_09 obj_11 - type_3
obj_07 obj_02 obj_05 - type_2
obj_06 obj_08 - object)
(:init
(pred_4 obj_04 obj_07)
(pred_2 obj_04 obj_01)
(pred_2 obj_04 obj_03)
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_11)
(pred_3 obj_06 obj_05)
(pred_3 obj_08 obj_05)
)
(:goal
(and
(pred_3 obj_06 obj_07)
(pred_3 obj_08 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_07) (pred_4 obj_10 obj_07))))
  )
)
)