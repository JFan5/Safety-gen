(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_06 obj_09 obj_02 obj_03 - type_3
obj_11 obj_13 obj_04 obj_12 - type_2
obj_07 obj_10 obj_08 - object)
(:init
(pred_3 obj_01 obj_12)
(pred_4 obj_01 obj_06)
(pred_4 obj_01 obj_09)
(pred_3 obj_05 obj_11)
(pred_4 obj_05 obj_02)
(pred_4 obj_05 obj_03)
(pred_2 obj_07 obj_12)
(pred_2 obj_10 obj_13)
(pred_2 obj_08 obj_13)
)
(:goal
(and
(pred_2 obj_07 obj_12)
(pred_2 obj_10 obj_11)
(pred_2 obj_08 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_13) (pred_3 obj_05 obj_13))))
  )
)
)