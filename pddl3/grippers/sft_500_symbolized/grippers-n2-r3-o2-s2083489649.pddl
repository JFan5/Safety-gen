(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_11 - type_1
obj_03 obj_01 obj_04 obj_09 - type_2
obj_02 obj_05 obj_08 - type_3
obj_10 obj_07 - object)
(:init
(pred_1 obj_06 obj_05)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_01)
(pred_1 obj_11 obj_02)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_09)
(pred_2 obj_10 obj_02)
(pred_2 obj_07 obj_02)
)
(:goal
(and
(pred_2 obj_10 obj_05)
(pred_2 obj_07 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_05) (pred_1 obj_11 obj_05))))
  )
)
)