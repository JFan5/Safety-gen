(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_2
obj_06 obj_03 obj_09 obj_07 - type_1
obj_11 obj_04 obj_01 - type_3
obj_10 obj_08 obj_05 - object)
(:init
(pred_4 obj_12 obj_04)
(pred_2 obj_12 obj_06)
(pred_2 obj_12 obj_03)
(pred_4 obj_02 obj_11)
(pred_2 obj_02 obj_09)
(pred_2 obj_02 obj_07)
(pred_3 obj_10 obj_04)
(pred_3 obj_08 obj_01)
(pred_3 obj_05 obj_11)
)
(:goal
(and
(pred_3 obj_10 obj_11)
(pred_3 obj_08 obj_04)
(pred_3 obj_05 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_12 obj_04) (pred_4 obj_02 obj_04))))
  )
)
)