(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_1
obj_04 obj_11 obj_10 obj_12 - type_2
obj_03 obj_05 obj_09 - type_3
obj_01 obj_08 obj_07 - object)
(:init
(pred_1 obj_02 obj_03)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_11)
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_10)
(pred_3 obj_06 obj_12)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_05)
(pred_2 obj_07 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_05)
(pred_2 obj_08 obj_09)
(pred_2 obj_07 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_05) (pred_1 obj_06 obj_05))))
  )
)
)