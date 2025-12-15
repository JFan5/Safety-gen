(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_1
obj_12 obj_04 obj_11 obj_09 - type_3
obj_05 obj_08 obj_03 - type_2
obj_06 obj_07 obj_10 - object)
(:init
(pred_3 obj_01 obj_05)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_04)
(pred_3 obj_02 obj_03)
(pred_4 obj_02 obj_11)
(pred_4 obj_02 obj_09)
(pred_2 obj_06 obj_08)
(pred_2 obj_07 obj_03)
(pred_2 obj_10 obj_05)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_07 obj_05)
(pred_2 obj_10 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_05) (pred_3 obj_02 obj_05))))
  )
)
)