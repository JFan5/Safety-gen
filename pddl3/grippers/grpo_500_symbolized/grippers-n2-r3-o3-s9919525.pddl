(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_1
obj_10 obj_01 obj_08 obj_04 - type_3
obj_11 obj_07 obj_09 - type_2
obj_02 obj_03 obj_06 - object)
(:init
(pred_3 obj_05 obj_07)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_01)
(pred_3 obj_12 obj_09)
(pred_4 obj_12 obj_08)
(pred_4 obj_12 obj_04)
(pred_2 obj_02 obj_07)
(pred_2 obj_03 obj_09)
(pred_2 obj_06 obj_11)
)
(:goal
(and
(pred_2 obj_02 obj_11)
(pred_2 obj_03 obj_09)
(pred_2 obj_06 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_11) (pred_3 obj_12 obj_11))))
  )
)
)