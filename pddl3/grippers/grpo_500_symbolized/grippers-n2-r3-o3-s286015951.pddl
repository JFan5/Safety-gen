(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_1
obj_03 obj_01 obj_12 obj_11 - type_3
obj_02 obj_05 obj_09 - type_2
obj_08 obj_04 obj_07 - object)
(:init
(pred_4 obj_10 obj_09)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_01)
(pred_4 obj_06 obj_05)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_11)
(pred_3 obj_08 obj_02)
(pred_3 obj_04 obj_09)
(pred_3 obj_07 obj_02)
)
(:goal
(and
(pred_3 obj_08 obj_05)
(pred_3 obj_04 obj_05)
(pred_3 obj_07 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_05) (pred_4 obj_06 obj_05))))
  )
)
)