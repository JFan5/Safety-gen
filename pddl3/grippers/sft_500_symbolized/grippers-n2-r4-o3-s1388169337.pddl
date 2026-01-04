(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_3
obj_12 obj_08 obj_09 obj_05 - type_1
obj_06 obj_11 obj_10 obj_13 - type_2
obj_07 obj_04 obj_01 - object)
(:init
(pred_4 obj_02 obj_10)
(pred_1 obj_02 obj_12)
(pred_1 obj_02 obj_08)
(pred_4 obj_03 obj_13)
(pred_1 obj_03 obj_09)
(pred_1 obj_03 obj_05)
(pred_3 obj_07 obj_10)
(pred_3 obj_04 obj_06)
(pred_3 obj_01 obj_06)
)
(:goal
(and
(pred_3 obj_07 obj_13)
(pred_3 obj_04 obj_10)
(pred_3 obj_01 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_13) (pred_4 obj_03 obj_13))))
  )
)
)