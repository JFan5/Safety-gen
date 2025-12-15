(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_10 obj_09 obj_03 obj_07 - type_2
obj_13 obj_11 obj_02 obj_08 - type_3
obj_05 obj_04 obj_12 - object)
(:init
(pred_4 obj_01 obj_13)
(pred_3 obj_01 obj_10)
(pred_3 obj_01 obj_09)
(pred_4 obj_06 obj_11)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_07)
(pred_1 obj_05 obj_02)
(pred_1 obj_04 obj_11)
(pred_1 obj_12 obj_11)
)
(:goal
(and
(pred_1 obj_05 obj_02)
(pred_1 obj_04 obj_13)
(pred_1 obj_12 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_01 obj_13) (pred_4 obj_06 obj_13))))
  )
)
)